--- Lua-функция для представления DamageEventListener.
export type DamageEventCallback = (source: LogicCharacter?, projectile: LogicProjectile?, damage: number, data: Data?, origin: AttackOrigin) -> ()

--- Lua-функция для представления SkillEventListener.
export type SkillEventCallback = (skill: Skill) -> ()

--- Lua-функция для представления SourceListener.
export type SourceCallback = (origin: AttackOrigin) -> ()

--- Lua-функция для представления BasicListener.
export type BasicCallback = () -> ()

--- Lua-функция для представления InputListener.
export type InputCallback = (index: number, spec0: number, spec1: number) -> ()

type createCallback0 = (class: "DamageEventListener", callback: DamageEventCallback) -> DamageEventListener
type createCallback1 = (class: "SkillEventListener", callback: SkillEventCallback) -> SkillEventListener
type createCallback2 = (class: "SourceListener", callback: SourceCallback) -> SourceListener
type createCallback3 = (class: "BasicListener", callback: BasicCallback) -> BasicListener
type createCallback4 = (class: "InputListener", callback: InputCallback) -> InputListener

--- Глобальный экземпляр класса Server.
declare server: Server

--- Ищет табличные данные (Data) по типу таблицы и имени.
declare lookup: <T>(subtype: number, name: string) -> (T & Data)

--- Создаёт LogicGameObject из соответствующего Data.
declare createObject: <T>(data: Data) -> (T & LogicGameObject)

--- Преобразует Lua-функцию в Java-объект (лямбду) соответствующего класса.
declare createCallback: createCallback0 & createCallback1 & createCallback2 & createCallback3 & createCallback4

--- Печатает строки в отладочные журналы и (если применимо) в чат дружеской комнаты.
declare function log(...: any): ()

--- Отправляет событие на клиент.
declare function event(action: string, data: any): ()

--- Глобально доступная библиотека `rxi/json.lua` для кодирования и декодирования JSON.
declare json: {
    --- Кодирует поддерживаемое Lua-значение в JSON.
    encode: (value: any) -> string,
    --- Декодирует JSON-строку в Lua-значение.
    decode: (value: string) -> any,
}
