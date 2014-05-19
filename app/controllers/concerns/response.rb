module Response
  include ActiveSupport::Concern

  def render_success(format, model, message)
    format.html { redirect_to model, notice: message }
    format.json { render :show, status: :created, location: model }
  end

  def render_error(format, model, action)
    format.html { render action }
    format.json { render json: model.errors, status: :unprocessable_entity }
  end

  def render_no_content(format, url, message)
    format.html { redirect_to url, notice: message }
    format.json { head :no_content }
  end
end
