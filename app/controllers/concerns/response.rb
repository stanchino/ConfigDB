module Response
  include ActiveSupport::Concern

  def render_success(format, success_status, success_url, success_message)
    format.html { redirect_to success_url, notice: success_message }
    format.json { render :show, status: success_status, location: success_url }
  end

  def render_errors(format, model, action)
    format.html { render action }
    format.json { render json: model.errors, status: :unprocessable_entity }
  end

  def render_no_content(format, url, message)
    format.html { redirect_to url, notice: message }
    format.json { head :no_content }
  end

  def create_object(object, success_url, success_message)
    respond_to do |format|
      if object.save
        render_success format, :created, success_url, success_message
      else
        render_errors format, object, :new
      end
    end
  end

  def update_object(object, attributes, success_url, success_message)
    respond_to do |format|
      if object.update(attributes)
        render_success format, :ok, success_url, success_message
      else
        render_errors format, object, :edit
      end
    end
  end

  def destroy_object(object, success_url, success_message)
    object.destroy
    respond_to do |format|
      render_no_content format, success_url, success_message
    end
  end
end
