# 🔐 Custom TPC Plugin with PowerShell

Custom CyberArk TPC/SRS plugin using **Process INI, Prompt INI, and PowerShell**.

## 📁 Plugin Structure

```text
Custom-TPC-Plugin/
│
├── platform-policy.ini
├── platform-policy.xml
├── MFTProcess.ini
├── MFTPrompts.ini
└── MFTScript.ps1
```

## 1. Create Plugin Files

Create/update:

* `MFTProcess.ini`
* `MFTPrompts.ini`
* `MFTScript.ps1`

Place them inside the `bin` folder.

## 2. Create Custom Platform

Duplicate the required base platform and create the custom platform.

Update the platform configuration with a **unique Plugin ID and Plugin Version**.

```ini
PluginName=Custom TPC Plugin with PowerShell
PluginVersion=1.0.0
PluginId=CustomTPCPowerShell
```

Make sure the Process and Prompt files point to:

```ini
ProcessFilename=MFTProcess.ini
PromptsFilename=MFTPrompts.ini
```

## 3. Create the ZIP

The final ZIP should contain:

```text
Custom-TPC-Plugin/
│
├── platform-policy.ini
├── platform-policy.xml
├── MFTProcess.ini
├── MFTPrompts.ini
└── MFTScript.ps1
```

Keep the folder structure intact.

## 4. Import Plugin

Import the ZIP into CyberArk and create/import the custom platform.

Use a **unique Plugin ID** so the custom plugin does not use the original plugin identity.

## 5. Verify Connector Cache

After deployment, verify the plugin on the Connector after initial run:

```text
C:\Program Files\CyberArk\Management Agent\Cache
```

Check that the custom plugin files are present under the deployed plugin folder.

```text
rotation_<platform>_<version>
│
├── platform-policy.ini
├── platform-policy.xml
├── MFTProcess.ini
├── MFTPrompts.ini
└── MFTScript.ps1
```

## 6. Test

```text
Verify
  ↓
Change
  ↓
Verify
```

Confirm the PowerShell script executes successfully.

---
