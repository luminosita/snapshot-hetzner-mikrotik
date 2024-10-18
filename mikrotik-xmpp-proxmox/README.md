# Deploy Mikrotik CHR 
### Step 1 - Create Vanilla Mikrotik Image

```bash
$ make mikrotik-vanilla
```

### Step 2 - Prepare Environment

```bash
$ SNAPSHOT_ID=<chr-vanilla-image-id> 
```

### Step 3 - Create Final Mikrotik Image

```bash
$ source final.sh 
```