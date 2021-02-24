- update package versions (security fixes)

      ./updateWorkspaceSnapshots.sh

- build docker images

      ./build.sh && bazel run '//iptables' --define HUB=khernyo

- publish docker images

      ./build.sh && bazel run '//iptables:publish' --define HUB=khernyo


