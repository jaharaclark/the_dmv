class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(record)
    @name = record[:name]
    @address = record[:address]
    @phone = record[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
