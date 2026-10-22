local counts = {}
local button_shown = false

const BUTTON_INPUT = 20

local texts = {
    "You clicked a button! Great?",
    "Well... You clicked it again!",
    "It seems to be interesting, isn't it?"
}

function render_button()
    event("updateUIItem", {
        -- TOML config ID
        tomlId = "nt_button_blue",
        -- Instance ID; further calls with same ID will update existing instance
        id = 10,
        x = 300.0,
        y = 300.0,
        -- Bindings may be defined via [bindings] or [buttons] sections in TOML
        -- For bindings pointing to TextField we can set its contents (actually it kinda overrides set_text section in TOML)
        texts = {
            { binding = "txt", text = "Click!" }
        },
        -- For bindings pointing to GameButton we can set custom callback
        buttons = {
            { binding = "button", client_input_value = BUTTON_INPUT }
        }
    })
end

function render_shelly(index)
    event("updateUIItem", {
        tomlId = "nt_tutorial", id = 20, x = 300.0, y = 100.0,
        texts = {
            { binding = "txt", text = texts[counts[index]] }
        },
        -- Select current animation (kinda override default_animation value in TOML)
        animation = "appear",
        -- It would be great to send this event to the specific player only, so...
        target_index = index
    })
end

function input(index, id, input)
    if input == BUTTON_INPUT then
        counts[index] = math.min(1 + (counts[index] or 0), 3)
        render_shelly(index)
    end
end

local listener = createCallback("InputListener", input)
server.customInputListeners:add(listener)

function tick()
    if server:isIntroFinished() and not button_shown then
        render_button()
        button_shown = true
    end
end

