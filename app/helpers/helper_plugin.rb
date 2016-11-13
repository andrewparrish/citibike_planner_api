require 'json'

module HelperPlugin
  def create_from_json(json)
    attr_hash = convert_hash(json)
    self.create(attr_hash)
  end

  def create_or_update_from_json(json)
    attr_hash = convert_hash(json)
    self.exists?(json['id']) ? self.find(json['id']).update(attr_hash) : self.create_from_json(json)
  end

  def convert_hash(json)
    hash = Hash[json.map { |k, v| [converted_hash[k.to_sym], v]}]
    hash.delete(nil)
    hash
  end
end