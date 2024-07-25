---convert_items_from_input_to_buffer
---@param balancer_index uint
---@param next_input uint
function convert_items_from_input_to_buffer(balancer_index, next_input)
    local balancer = global.balancer[balancer_index]
    local ilane = balancer.input_lanes[next_input]
    local lane_size = #ilane
    if lane_size > 0 then
        for i = 1,lane_size do
            balancer.buffer[#balancer.buffer + 1] = {
                name = ilane[i].name,
                count = ilane[i].count}
        end
        -- Will always dump entire lane contents (up to all 4 items on belt lane) into buffer, so clear lane contents
        ilane.clear()
    end
end
