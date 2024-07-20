settings
{
    priority=1
    exclude.where = !process.is_explorer
    showdelay = 200
    modify.remove.duplicate=1
    tip.enabled=true
}

menu(separator="before" title='New File' image=icon.new_file)
{
    $dt = sys.datetime("ymdHMSs")
    item(title='TXT' image=\ue230 cmd=io.file.create('Temp.txt', 'Hello World!'))
    item(title='PY' image=\ue243 cmd=io.file.create('Temp.py', 'Print("Hello World!")'))		
}
item(title='New Folder' image=icon.new_folder cmd=io.dir.create(" "))

separator
item(type='file' title='Archive' image=[\ue223] cmd='7z' args='a -tzip "archive.zip" @sel.name' window='hidden')
item(type='dir|back.dir' title='Archive' image=[\ue223] cmd='7z' args='a -tzip "archive.zip" @sel.directory' window='hidden')
item(type='file|dir' where=sel.count>1 image=[\ue223] mode="multiple" title='Archive' cmd='7z' args='a -tzip "archive.zip" @sel(true, " ")' window='hidden' invoke=multiple)

separator
item(mode="single" title="Copy Path" image=\ue1a6 tip=sel.path cmd=command.copy(sel.path))
separator

item(title="Toggle Hidden" image=icon.show_hidden_files cmd='@command.togglehidden')

item(type='file|dir|back.dir|drive' title='Take Ownership' image=[\uE194,#f00] admin
    cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
separator

//VS code and PowerShell
item(title='Visual Studio Code' image=[\uE272] cmd='code' args='"@sel.path"')

$tip_run_admin=["\xE1A7 Press SHIFT key to run " + this.title + " as administrator", tip.warning, 1.0]
$has_admin=key.shift() or key.rbutton()

item(title='Powershell' image=\ue218 admin=has_admin tip=tip_run_admin cmd='pwsh.exe' args='-noexit -command "Set-Location @sel.dir\"')

remove(find='Personalize')
remove(find='Display settings')
remove(find='Terminal')
remove(find='Windows PowerShell')
remove(find='Disk Management')
remove(find='Network Connections')
remove(find='System')
remove(find='Event Viewer')
remove(find='Power Options')
remove(find='Mobility Center')
remove(find='Installed apps')
remove(find='Visual Studio')
remove(find='New')
remove(find='Share hub')
remove(find='Edit in Notepad')
remove(find='Add to Favorites')
remove(find='Troubleshoot compatibility')
remove(find='Microsoft Defender')
remove(find='Sync')
remove(find='available')
remove(find='macrium')
remove(find='autoplay')
remove(find='bitlocker')
remove(find='7-zip')
remove(find='edit')
remove(find='customize this folder')
remove(find='give access')
remove(find='open with')
remove(find='Copy as path')
remove(find='Share')
remove(find='Restore previous versions')
remove(find='send to')
remove(find='Include in library')
remove(find='Pin to Start')
remove(find='print')
remove(find='Open PowerShell window here')
// remove(find='')
// remove(find='')
// remove(find='')
// remove(find='')
// remove(find='')


import 'imports/taskbar.nss'
import 'imports/theme.nss'
import 'imports/images.nss'
