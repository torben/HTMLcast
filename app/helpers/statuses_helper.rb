module StatusesHelper
  def status_for(object)
    return unless object.respond_to?(:status_id)

    status_id = object.status_id
    # can't we somehow set the status according to the user being verified/not verified?
    status_id = object.confirmed? ? Status::ACTIVE : Status::NOT_VERIFIED if object.is_a?(User)

    t(:"activerecord.attributes.#{object.class.name.underscore}.status.#{status_id}", :default => :"status.#{status_id}")
  end

  def statuses_for_select(klass)
    [Status::ACTIVE, Status::LOCKED].collect do |status_id|
      [t(:"activerecord.attributes.#{klass.name.underscore}.status.#{status_id}", :default => :"status.#{status_id}"), status_id]
    end
  end
end