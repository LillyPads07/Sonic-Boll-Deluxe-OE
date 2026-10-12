var dir;

dir = global.workdir+"SBDX_mods\object\"

global.lemonCustomObjectPal=sprite_duplicate(spr_editpalblank)

cleanupObjects();

var _folder;
_folder = file_find_first(dir+"*",fa_directory)

while(_folder != "") {
    if (_folder!="." && _folder!="..") {
        //find #defines
        var i,_code,_str,_cur,_list,_filepath,_file,_name;
        _name = filename_name(_folder);
        _file=_folder+"\object.gml";
        _filepath = dir+_file;
        if (file_exists(_filepath)) {
            if !file_exists(_filepath) {
                continue;
            }

            _code = file_text_open_read(_filepath);
            if (_code == -1) continue;

            _list = ds_list_create();

            _cur = "";
            _str = "";
            while (!file_text_eof(_code)) {
                _cur = file_text_read_string(_code);

                if string_starts_with(_cur, "#define") {
                    _cur = string_delete(_cur, 1, 8)
                    ds_list_add(_list,_cur)
                }

                file_text_readln(_code);
                if file_text_eof(_code) {
                    break;
                }
            }
            file_text_close(_code);

            i=0;
            repeat(ds_list_size(_list)) {
                var _store,_key,_compiled, _codestr;
                _key = ds_list_find_value(_list,i);

                switch(_key) {
                    case "create":
                    case "data":
                    case "step":
                    case "step_end":
                    case "step_begin":
                    case "draw":
                    case "draw_gui":
                    case "cleanup":
                    case "deloaded":
                    case "lemon_display":
                    case "lemon_preview":
                    case "lemon_data":
                    case "updatedeities":
                    case "editobjmenu":
                    case "editobjdataname":
                    case "carry_release": //letting go of carryable object
                    case "hitblock": //hittable
                        _codestr = loopThrough(_key, _filepath)
                        if (_codestr != "") {
                            _compiled = code_compile(_codestr)
                            if (_key == "data") {
                                code_execute(_compiled);
                                code_destroy(_compiled);
                            }
                            ds_map_set(global.objectscripts,_key+"_"+_name,_compiled)
                        }
                    break;
                    case "object_type":
                        str = string_trim(loopThrough(_key, _filepath),chr(13),chr(10));
                        ds_map_set(global.customobjecttypes,_name,str)
                    break;
                    default : show_message("Invalid define ("+_key+") in "+_file+"!") break;
                }
                i+=1;
            }
            ds_list_destroy(_list);

            _file=dir+_folder+"\lemon.ini";

            if (file_exists(_file)) {
                var _tempmap,_parent;
                _tempmap = ds_map_create();

                ini_open(_file);

                ds_map_set(_tempmap,"displayname",ini_read_string("lemon","displayname","missing name"))
                ds_map_set(_tempmap,"description",ini_read_string("lemon","description",""))
                ds_map_set(_tempmap,"palspritename",ini_read_string("lemon","palspritename",""))
                ds_map_set(_tempmap,"parent",ini_read_string("lemon","parent",_name));

                if (ds_map_get(_tempmap,"palspritename")!="") {
                    if (file_exists(dir+_folder+"\"+ds_map_get(_tempmap,"palspritename")+".png")) {
                        var tempsprite;
                        tempsprite = sprite_add(dir+_folder+"\"+ds_map_get(_tempmap,"palspritename")+".png",1,0,0,0,0);
                        ds_map_set(_tempmap,"palspriteindex",sprite_get_number(global.lemonCustomObjectPal))
                        sprite_merge(global.lemonCustomObjectPal,tempsprite);
                        sprite_delete(tempsprite);
                    }
                }

                ds_map_set(global.objectlemonlist,_name,ds_map_write(_tempmap));
                ds_map_destroy(_tempmap);

                ini_close();
            }
        }
    }

    _folder = file_find_next();
}
_folder = file_find_close();

with(lemongrab) {
    ds_map_destroy(n);
    ds_map_destroy(m);
    ds_map_destroy(d);
    lemonobjlist();
}
