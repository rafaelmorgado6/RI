function ClearGrippers(hGripper1, hGripper2)

    if isvalid(hGripper1)
        delete(hGripper1); % Remove a primeira garra
    end

    if isvalid(hGripper2)
        delete(hGripper2); % Remove a segunda garra
    end
end
