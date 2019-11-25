{
    "id": "b3315883-2ae1-492c-99d2-b12a1d646504",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "window_command_hook",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 113497714299118,
    "date": "2019-58-23 07:11:16",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "5f550ae2-3d02-4144-93ac-6956d8e9f940",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 113497714299118,
            "filename": "window_command_hook.dll",
            "final": "window_command_cleanup",
            "functions": [
                {
                    "id": "34799d26-f5b1-44c4-abc5-5e9021b886d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "window_command_run_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_run_raw",
                    "returnType": 2
                },
                {
                    "id": "3e1de6cd-6b66-4bf9-80f0-f2019390ecf8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_command_cleanup",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_cleanup",
                    "returnType": 2
                },
                {
                    "id": "8c9d4eeb-9324-44b1-beed-6dc05834734e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_command_init_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_init_raw",
                    "returnType": 2
                },
                {
                    "id": "c67b5e7c-43c9-4708-b0d7-123967a514ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_command_bind_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_bind_raw",
                    "returnType": 2
                },
                {
                    "id": "d9ed6a86-dc26-47a9-89d4-d6bb0022851d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_command_hook_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_hook_raw",
                    "returnType": 2
                },
                {
                    "id": "567b4212-4506-46c0-bad0-492bb5960606",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_unhook_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_unhook_raw",
                    "returnType": 2
                },
                {
                    "id": "c040e314-44b0-40bb-b0a3-d312bc8e18a8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_command_get_active_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_get_active_raw",
                    "returnType": 2
                },
                {
                    "id": "24c82178-534d-4af7-bbd1-b913e4797e20",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "window_command_set_active_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_set_active_raw",
                    "returnType": 2
                },
                {
                    "id": "b917017c-b6bf-43c6-8c57-ec641de8fc9f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_check",
                    "help": "window_command_check(button) : Returns whether the given button was pressed since the last call to this function.",
                    "hidden": false,
                    "kind": 1,
                    "name": "window_command_check",
                    "returnType": 2
                },
                {
                    "id": "e3ce372d-1137-41ae-a664-901d428d99f6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_topmost_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_topmost_raw",
                    "returnType": 2
                },
                {
                    "id": "2ed0eb76-618b-4fb6-a679-671adb7eea9e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_get_background_redraw",
                    "help": "window_get_background_redraw()",
                    "hidden": false,
                    "kind": 1,
                    "name": "window_get_background_redraw",
                    "returnType": 2
                },
                {
                    "id": "d280d2b6-746c-4369-93f7-947402288d7e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_background_redraw_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_background_redraw_raw",
                    "returnType": 2
                },
                {
                    "id": "43232542-c7a4-4483-a87a-291c2a67bb53",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_taskbar_button_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_taskbar_button_raw",
                    "returnType": 2
                },
                {
                    "id": "f721aa41-dd8e-46c9-9d09-9eb43dd155a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_get_taskbar_button_visible_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_get_taskbar_button_visible_raw",
                    "returnType": 2
                },
                {
                    "id": "5752b167-dcdc-43dc-8cb1-ed99adb7af12",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_taskbar_button_visible_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_taskbar_button_visible_raw",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\window_command_hook.dll",
            "uncompress": false
        },
        {
            "id": "8b84b462-1ee3-43aa-8d2b-228dcee29fec",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "ccaa5dd6-891b-44a5-8931-9b3103ad7da6",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_close",
                    "hidden": false,
                    "value": "$F060"
                },
                {
                    "id": "d0307340-7b20-471a-ac59-a3bc6cf7be5f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_maximize",
                    "hidden": false,
                    "value": "$F030"
                },
                {
                    "id": "36d944de-0ea8-4768-8a96-e17780da7a0b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_minimize",
                    "hidden": false,
                    "value": "$F020"
                },
                {
                    "id": "84788c9a-ad52-45ba-9431-f0ec6679d6d0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_restore",
                    "hidden": false,
                    "value": "$F120"
                },
                {
                    "id": "e85e11a6-2074-46aa-95a4-f35ca085a8ed",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_resize",
                    "hidden": false,
                    "value": "$F000"
                },
                {
                    "id": "c62318b5-adc3-4dcd-abe4-a66fb8933041",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_move",
                    "hidden": false,
                    "value": "$F010"
                }
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "window_command_hook.gml",
            "final": "",
            "functions": [
                {
                    "id": "3915c304-a945-4e4f-899f-8bd3e02ceb8a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_command_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_init",
                    "returnType": 2
                },
                {
                    "id": "c34e20b9-0199-45ca-9670-1f7c234894b0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_hook",
                    "help": "window_command_hook(index): Hooks the specified command ",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_hook",
                    "returnType": 2
                },
                {
                    "id": "ae0d3c11-ec4f-4dd8-bb87-23ef43866904",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_unhook",
                    "help": "window_command_unhook(index):",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_unhook",
                    "returnType": 2
                },
                {
                    "id": "a90f97cf-89bd-4ee4-9afe-90401a6f1cb5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_command_run",
                    "help": "window_command_run(index, param = 0):",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_run",
                    "returnType": 2
                },
                {
                    "id": "5cd93b63-9915-4721-8238-f78033ed66d3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_get_active",
                    "help": "window_command_get_active(command): Returns whether the given command is currently available.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_get_active",
                    "returnType": 2
                },
                {
                    "id": "429ee758-27f7-4b8d-97b9-f2c8e3525970",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "window_command_set_active",
                    "help": "window_command_set_active(command, status:bool): Enables\/disables the command. Returns -1 if not possible.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_set_active",
                    "returnType": 2
                },
                {
                    "id": "e8e54b97-2eff-49b9-9b2a-fb65b5b5c952",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_topmost",
                    "help": "window_set_topmost(stayontop:bool): Allows to set a window to show on top of the rest like with GM8.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_topmost",
                    "returnType": 2
                },
                {
                    "id": "dc45f318-4b29-4d55-a7e2-6c3b4dcd2f0e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_background_redraw",
                    "help": "window_set_background_redraw(redraw_enabled:bool)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_background_redraw",
                    "returnType": 2
                },
                {
                    "id": "4fc1c44e-ea2a-49bf-ab9c-35bfa942026d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_taskbar_button",
                    "help": "window_set_taskbar_button(enable:bool)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_taskbar_button",
                    "returnType": 2
                },
                {
                    "id": "c858abaf-4953-4cc4-9f44-da6df8064e66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_taskbar_button_visible",
                    "help": "window_set_taskbar_button_visible(enable:bool)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_taskbar_button_visible",
                    "returnType": 2
                },
                {
                    "id": "53c91cfe-2fdb-47fe-b3f6-c2cf0169c6a5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_get_taskbar_button_visible",
                    "help": "window_get_taskbar_button_visible()->enabled?",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_get_taskbar_button_visible",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Proprietary",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "F79C97955FD1AF4686EB4EF4EF90F0DB",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}