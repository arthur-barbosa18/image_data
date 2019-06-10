module Concerns
  module CrudActions
    extend ActiveSupport::Concern

    included do
      helper_method :collection, :resource, :resource_class, :namespace
    end

    module ClassMethods
    end

    def index(options = {})
      collection = collection(options[:base_scope])
      render_json(collection)
    end

    def show
      render_json(resource)
    end

    def create
      object = resource_class.new(create_params)
      render_json(object, :created) && return if object.save!
      raise(ActiveRecord::RecordInvalid, object) if object.errors.any?
    end

    def update
      if resource.update(update_params)
        render_json(resource)
      else
        render_unprocessable(resource)
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::InvalidForeignKey => e
      render_unprocessable(e)
    end

    def destroy
      if resource.destroy
        render_json
      else
        render json: resource.errors, status: :precondition_failed
      end
    end

    protected

    def collection(scope = nil)
      scope ||= resource_class
      @collection = apply_scopes(@collection.present? ? @collection : scope)
      apply_collection(@collection)
    end

    def resource
      @resource ||= instance_variable_get("@#{resource_name.downcase}")
      @resource ||= try_find_resource
      @resource ||= resource_class.new

      apply_resource(@resource)
    end

    def render_json(data = nil, status = :ok)
      json = resource_serializer.try(:new, data)
      json ||= data
      render json: json, status: data.nil? ? :no_content : status
    end

    def paginate_collection(collection)
      collection.page(params[:page]).per(params[:per_page])
    end

    def apply_collection(collection)
      collection = paginate_collection(collection) if paginate?
      collection = collection.all if collection == resource_class
      @collection = collection
      instance_variable_set("@#{resource_name.tableize}", @collection)
    end

    def apply_resource(object)
      instance_variable_set("@#{resource_name.downcase}", object)
    end

    def try_find_resource
      id = params[:id]
      id ||= params["#{resource_name.underscore}_id".to_sym]

      return resource_class.find(id) if id
    end

    def resource_class
      resource_name.constantize
    end

    def resource_name
      controller_name.classify
    end

    def resource_serializer
      serializer = "#{resource_name}Serializer"
      serializer.safe_constantize
    end

    def namespace
      tokens = self.class.to_s.split('::')
      tokens.size > 1 ? tokens.first.underscore.to_sym : nil
    end

    def paginate?
      params[:page].present? && params[:per_page].present?
    end

    def create_params
      raise MESS
    end

    def update_params
      raise MESS
    end
  end
end
