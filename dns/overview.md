<p class="note">Note: This feature is still under development; however, there are portions of DNS functionality that are already available in bosh-release v262+. 3468+ Linux stemcells are required.</p>

Using DNS instead of plain IPs within deployments:

- allows easy use of dynamic networks since IPs change with every redeploy
- provides a way to reference deployed VMs more transparently
- provides client side load balancing
- reduces number of configuration changes that need to be propagated when changing cluster layout

Historically BOSH users did not have an easy highly available solution to enable DNS for their deployments. PowerDNS was a possible choice; however, it required more advanced configuration that we did not feel comfortable recommending to everyone.

Addition of native BOSH DNS solves these problems without making it hard to deploy and operate DNS servers.
