
---

### [choco://vivetool](choco://vivetool)

To use choco:// protocol URLs, install [(unofficial) choco:// Protocol support](https://community.chocolatey.org/packages/choco-protocol-support)

---

## ViVeTool

ViVeTool is an open-source command-line application for Windows power users that enables interaction with the Windows Feature Store, a component that can toggle various experimental functionality and features.

### Usage Statement

```text
ViVeTool - Windows feature configuration tool

Available commands:
  /query                Lists existing feature configuration(s)
  /enable               Enables a feature
  /disable              Disables a feature
  /reset                Removes custom configurations for a specific feature
  /fullreset            Removes all custom feature configurations
  /changestamp          Prints the feature store change counter (changestamp)*
  /querysubs            Lists existing feature usage subscriptions*
  /addsub               Adds a feature usage subscription
  /delsub               Removes a feature usage subscription
  /notifyusage          Fires a feature usage notification
  /export               Exports custom feature configurations
  /import               Imports custom feature configurations
  /lkgstatus            Prints the current 'Last Known Good' rollback system status
  /fixlkg               Fixes 'Last Known Good' rollback system corruption
  /fixpriority          Moves Override type configurations from Service to User priority*
  /appupdate            Checks for a new version of ViVeTool*
  /dictupdate           Checks for a new version of the feature name dictionary*

Commands can be used along with /? to view more information about usage
*Does not apply to commands marked with an asterisk
```

**WARNING: ViVeTool modifies core Windows components that can potentially lead to instability, crashes, difficult-to-diagnose issues, and making irreversible changes to your operating system. Use at your own risk!**

## Package Notes

The feature name dictionary is maintained independently of the application. Therefore, the dictionary as packaged with the application may be outdated. Consider using the `/dictupdate` switch after installation to ensure you're working with an up-to-date dictionary.
