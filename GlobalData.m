%COVID-19 Statistics Data App
%author Rodrigo Jost
%since 06/12/2021
%version 1.0

classdef GlobalData
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = public)
        DataStr %cell array of death and cases, fits global DEFINE?  
        %first element: data for the entire world, after that, the countries
        Name
    end

    methods (Access = public)
        function obj = GlobalData(Name, data)
            obj.Name = Name;
            obj.DataStr = CountryData.empty;
            s = size(data);
            nav = 2;
            while nav <= s(1)
                identifier = string(data(nav, 1));
                ActualData = cell(1,s(2));
                ActualData(end,:) = data(nav,:); 
                if nav ~= s(1)
                    while strcmp(identifier,data(nav+1, 1))
                        ActualData(end+1,:) = data(nav+1,:);                    
                        nav = nav + 1;
                    end
                end

                obj.DataStr(1, end+1) = (CountryData(data(nav, 1), ActualData));
                nav = nav + 1;
            end

        end

        function allCountriesNames = getAllCountriesNames(obj)

            s = size(obj.DataStr);
            allCountriesNames = string.empty;

            for nav = 1:s(2)
                allCountriesNames(1,end+1) = string(getCountryName(obj.DataStr(1,nav)));
            end
        
        end
        
        function allCountries = getAllCountries(obj)
            
            allCountries = obj.DataStr;

        end

        function allStatesNames = getAllStatesNames(identifier, obj)
  
            s = size(obj.DataStr);
            allStatesNames = string.empty;

            for nav = 1:s(2)
                if strcmp(identifier, string(getCountryName(obj.DataStr(1,nav))))
                    allStatesNames = getStatesNamesOfCountry(obj.DataStr(1,nav));
                end
            end           
        end

        function casesAndDeathsOfState = getAllCumulativeData(country, state, obj)
            s = size(obj.DataStr);
            for nav = 1:s(2)
                if strcmp(country, string(getCountryName(obj.DataStr(1,nav))))
                    casesAndDeathsOfState = getStateData (obj.DataStr(1,nav), state);                    
                end           
            end
        end
    end                         
end