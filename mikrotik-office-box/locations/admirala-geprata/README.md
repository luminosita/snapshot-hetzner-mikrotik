# Setup Mikrotik
## SCP
- setup.txt
- admirala-geprata/vars.txt
- secure.txt
- base.txt
- certificates.txt
- pppoe.txt
- nat.txt
- wireless.txt

## Create Setup Script
```bash
$ /system/script/add name="setup" source="[/file get [/file find where name="setup.txt"] contents]"
```

## Run Setup Script
```bash
$ /system/script/run [find where name="setup"]
```