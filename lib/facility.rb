require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(record)
    @name = record[:name]
    @address = record[:address]
    @phone = record[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.plate_type = :ev
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    end
  end

  def administer_written_test(registrant)
    if services.include?('Written Test')
      if registrant.age >= 16 && registrant.permit == true
        registrant.license_data[:written] = true
      end
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test')
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      end
    end
  end
end
