#Create setup scripts from uploaded files
  
:global initScript do={
    :local fullname "$title.rsc"
    :local pFile [/file find where name=$fullname]

    if ($pFile != "") do={
        :local content [/file get $pFile contents]
        
        /system script
        add name="$title" source="$content"
        
        :put "Script ($title) created."

        /log info message="Script ($title) created."

        /file remove $pFile
    }
}

$initScript title="first-boot"

/log info message="Adding first-boot scheduler ..."

/system/scheduler 
add name="Boot" on-event="first-boot" interval=0s start-time=startup

/file/remove [find where name="setup.rsc"]
