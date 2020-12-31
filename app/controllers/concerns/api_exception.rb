module ApiException
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: errors_json([{ status: 404, code: 404, title: 'Not found' }]), status: :not_found
    end
  
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: errors_json([{ status: 422, code: 422, title: 'unprocessable entity' }]), status: :unprocessable_entity
    end

    rescue_from Pundit::NotAuthorizedError do |e|
      render json: errors_json([{ status: 401, code: 401, title: 'unauthorized' }]), status: :unauthorized
    end

    private 
  
      def errors_json(messages)
        { jsonapi: { version: '1.0' }, errors: [*messages] }
      end
  end
end