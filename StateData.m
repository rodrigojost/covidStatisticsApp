%COVID-19 Statistics Data App
%author Rodrigo Jost
%since 06/12/2021
%version 1.0

classdef StateData
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = public)
        DataStr %cell array of death and cases, fits country states 
        Name
    end

    methods (Access = public)
        function obj = StateData(data)
            %stores data for one state
            obj.Name = string(data(1, 1));
            s = size(data);
            obj.DataStr = cell(s(2)-1, 1);
            obj.DataStr(1:(s(2)-1), 1) = data(1,2:end);
        end

        function data = getStateCumulativeData(obj)
            data = obj.DataStr; %returns an array with the name of the state and its data
        end

        function name = getStateName(obj)
            name = obj.Name; 
        end

    end
end