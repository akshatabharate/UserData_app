class User
  include Mongoid::Document

  
  field :firstName , type: String
  field :lastName , type: String
  field :email , type: String

  
  #index (firstName: 'text',lastName: 'text', email: 'text'}
  #index firstname: 'text', lastname: 'text', email: 'text'
  # model.collection.createIndex( { firstName: 'text', lastName: 'text', email: 'text'} )

 
  # def self.search(search)
  #   if search
  #     any_of({firstName: /#{search}/i},{lastName: /#{search}/i},{email: /#{search}/i})
  #   end
  # end
end
