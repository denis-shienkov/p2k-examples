# Build with QtCreator

1. Add the `tcc` compiler as a custom C-compiler from the
`Edit->Preferences->Kits->Compilers` with the TCC name (as example).

2. Change the ABI to `arm-unknown-unknown-unknown-unknown`.

3. Set the error parser as `GCC` (for example).

4. Click on `Apply` button.

5. Go to `Edit->Preferences->Kits->Kits` tab and add a new kit
named as `P2K` (as example).

6. Configure the `P2K` kit with the following properties:

 - Device type: `Desktop`
 - Device: `Local PC`
 - Build device: `Local PC`
 
(or you can choose the bare metal device instead, it is irrelevant).

 - Compiler C: `TCC`
 - Compiler C+: `none`
 - Debugger: `none`
 - Qt: `none`

 - Click on `Additional Qbs Profile Settings` change button and
add the following additional properties:
    * qbs.architecture: arm
    * qbs.toolchainType: tcc

- Click on `Apply` button.

7. Check that the Qbs propertires are set successfully, goto
`Edit->Preferences->Qbs->Profiles`, choose the `P2K` profile
and expand items. Check that there are the following:

- for `cpp` entry:
    * cCompilerName: `tcc.exe`
    * compilerName: `tcc.exe`
    * toolchainInstallPath: `C:/ARM`

- for `qbs` entry:
    * architecture: `arm`
    * targetPlatform: ``
    * toolchainType: `tcc`

8. To build the project, just open the `examples.qbs` file
from the Qt Creator, assign the `P2K` kit, choose the shadow
build directories, and then press the `Build` button.

9. Right now an example of the command line flags are following:

C:\ARM\tcc.exe -c E:/git/ng/test/P2K/examples/apps/screenshot/screenshot.c -o E:/git/ng/test/P2K/build-examples-release/Release_P2K_ddceb7d8c577e352/screenshot.754d2e97/3a52ce780950d4d9/screenshot.c.o -D__P2K__ -IC:/ARM/SDK -bigend -apcs /interwork
C:\ARM\armlink.exe -nolocals -reloc E:/git/ng/test/P2K/build-examples-release/Release_P2K_ddceb7d8c577e352/screenshot.754d2e97/3a52ce780950d4d9/screenshot.c.o C:/ARM/lib/Lib_L2_L6.o -o E:/git/ng/test/P2K/build-examples-release/Release_P2K_ddceb7d8c577e352/screenshot.754d2e97/screenshot.elf
