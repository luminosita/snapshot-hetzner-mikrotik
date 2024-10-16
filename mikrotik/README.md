# Deploy Mikrotik CHR 
### Step 1 - Create Vanilla Mikrotik Image

```bash
$ make mikrotik-vanilla
```

### Step 2 - Create Final Mikrotik Image

```bash
$ cd mikrotik
$ SNAPSHOT_ID=<chr-vanilla-image-id> source scripts/boostrap.sh 
```