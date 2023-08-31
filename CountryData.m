%COVID-19 Statistics Data App
%author Rodrigo Jost
%since 06/12/2021
%version 1.0

classdef CountryData
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    properties (Access = public)
        DataStr %cell array of death and cases, fits country
        %first element: data for the entire world, after that, the states
        Name
    end

    methods (Access = public)
        function obj = CountryData(Name, data)
            obj.Name = string(Name);
            obj.DataStr = StateData.empty;
            s = size(data);
            data (1, 2) = cellstr("All");
            for nav = 1:s(1)
                

                obj.DataStr(1, end+1) = (StateData(data(nav, 2:end)));

            end
        end

        function countryStatesNames = getStatesNamesOfCountry(obj)
          
            s = size(obj.DataStr);
            countryStatesNames = string.empty;
    
            for nav = 1:s(2)
                countryStatesNames(1,end+1) = string(getStateName(obj.DataStr(1,nav)));
            end
             %returns string of names of states       
        end

        function name = getCountryName(obj)
            name = obj.Name;            
        end

        function stateData = getStateData(obj, identifier)

            s = size(obj.DataStr);
            stateData = cell(s(2), 1);
    
            for nav = 1:s(2)

                if strcmp(string(getStateName(obj.DataStr(nav))), identifier)
                    stateData = getStateCumulativeData(obj.DataStr(nav));
                end
            end                    
        end
    end
end