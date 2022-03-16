class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  #Associations
  belongs_to :kind do 
    link(:related){contact_kind_url(object.id)}
  end
  
  has_many :phones do 
  link(:related){contact_kind_url(object.id)}
  end
  has_one :address

  # link(:self){contact_url(object.id)}
  # link(:kind){kind_url(object.kind.id)}

  meta do
    {author: "Galeno"}
  end

  def attributes(*args)
    h = super(*args)
    #h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end

end