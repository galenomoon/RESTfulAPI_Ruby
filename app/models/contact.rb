class Contact < ApplicationRecord

  #Associations
  belongs_to :kind #, optional: true
  has_many :phones

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
  #   }
  # end

  # def author
  #   "Galeno"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description]
  #     #, include: {kind: {only: :description}}
  #     )
  # end
end
