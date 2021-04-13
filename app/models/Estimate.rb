class Estimate < ActiveRecord::Base
    belongs_to :job

    def self.surface_area(job_id)
        final_surface_area = 0 
        surface_area_array = Job.find(job_id).rooms.map do |room|
            final_surface_area += 2*(room.length*room.height + room.height*room.width) + room.width*room.length
        end
        final_surface_area
    end

    def self.material_cost(behr_premium, surface_area)
        # 57600 is the square inches on gallon of paint covers. 30 is the average cost of a gallon of paint
        #43 is the average cost per gallon of amrquise behr paint
        if behr_premium == true
            cost = surface_area / 57600 * 43      
        elsif behr_premium == false
            cost = surface_area / 57600 * 30
        end
    end

    def self.labor_cost(surface_area ,rate)
        # 21600 is average square inches a painter paints in one hour average rate is 65 - 80 usd
            surface_area / 21600 * rate
    end
end