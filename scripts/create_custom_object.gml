///create_custom_object(x,y,objid)
if is_string(argument2) {
    var objtype,o,_obj;
    objtype=argument2
    switch(ds_map_find_value(global.customobjecttypes,objtype)) {
        case "enemy":
        _obj = customobjectenemy
        break;
        case "collider":
        _obj = customobjectcollider
        break;
        case "barrier":
        _obj = customobjectbarrier
        break;
        case "phaser":
        _obj = customobjectphaser
        break;
        case "hittable":
        _obj = customobjecthittable
        break;
        case "moving":
        _obj = customobjectmoving
        break;
        case "movingphaser":
        _obj = customobjectmovingphaser
        break;
        default: _obj = customobject break;
    }
    o=instance_create(argument0,argument1,_obj)
    o.mytype = objtype
    with(o) {
        if (object_index!=customobjecthittable) {
            event_user(0);
        } else {
            event_user(5);
        }
    }

    return o
}

return noone
