-- NUI Callback

RegisterNUICallback('GetGalleryData', function(_, cb)
    local data = PhoneData.Images
    cb(data)
end)

RegisterNUICallback('DeleteImage', function(image,cb)
    TriggerServerEvent('indigo-phone:server:RemoveImageFromGallery',image)
    Wait(400)
    TriggerServerEvent('indigo-phone:server:getImageFromGallery')
    cb(true)
end)

-- Events

RegisterNetEvent('indigo-phone:refreshImages', function(images)
    PhoneData.Images = images
end)