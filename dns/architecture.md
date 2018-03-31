To provide native DNS support following changes were made:

- Director keeps track of DNS entries assigned to each instance
- Agent (on stemcells 3421+) updates DNS records metadata on its VM
- DNS release (more details below) provides resolution of BOSH specific DNS records

Given that the Director is the sole orchestrator of the system, it is now responsible for updating DNS records during a deploy. As VMs are created and deleted following DNS related steps happen:

1. Director notices that VM, after it's created or deleted, changed its IP
1. Director creates a new DNS records dataset and saves it to the blobstore
1. Director issues sync_dns Agent call to *all* VMs (in all deployments)
1. Each Agent downloads new DNS records dataset and updates `/var/vcap/instance/dns/records.json`
1. DNS release sees that local `/var/vcap/instance/dns/records.json` is updated, hence returns new information in future DNS requests
