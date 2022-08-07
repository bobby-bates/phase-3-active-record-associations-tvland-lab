class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def build_network call_letters
    self.network = Network.find_or_create_by call_letters
  end

  def actors_list
    self.actors.map { |actor| "#{actor.first_name} #{actor.last_name}" }
  end
end
