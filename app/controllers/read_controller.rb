class ReadController < ApplicationController
    include Parser
    def getById
        resources = parse()

        validTypes = Array.new

        # valid resources do not contain "not" in their value code and for this instance are read
        resources.each do |i|
            if i["interaction"]
                i["interaction"].each do |j|
                    if !j["extension"][0]["valueCode"].downcase.include?("not") && j["code"].downcase == "read"
                        validTypes.push(i["type"].downcase)
                        break
                    end
                end
            end
        end

        type = params[:type]
        id = params[:id]
        if validTypes.include?(type.downcase)
            json_response(validTypes)
            # here we would query our DB for the type if it's a valid type and then lookup the id
            # so for allergy intolerance we have an allergy intolerance table and lookup the id
        else
            render :json => "Unknown Resource type: #{type}, valid resource types are : #{validTypes}", :status => 404
        end

        

        
    end
end