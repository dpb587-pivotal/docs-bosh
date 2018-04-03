### Recovering Deployment State <a id="recover-deployment-state"></a>

If for some reason you've lost your deployment state file, or have not saved the updates from the last run of the deploy command:

1. Create a file a new deployment state file as `state.json`. Write out following contents:

  ```json
  {
      "current_vm_cid": "<VM_ID>",
      "current_disk_id": "disk1",
      "disks": [{ "id": "disk1", "cid": "<DISK_ID>" }]
  }
  ```

1. Replace `<VM_ID>` with the ID of the VM found in the IaaS. For example on AWS it may be `i-f62df90b`.

1. Replace `<DISK_ID>` with the ID of the persistent disk found in the IaaS. For example on AWS it may be `vol-6370ec29`.

1. Run `bosh create-env bosh.yml --state=state.json -o ... -v ...` which will recreate the VM and migrate the disk contents.

1. Save the deployment state file.
