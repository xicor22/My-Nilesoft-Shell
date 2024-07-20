menu(type="taskbar" vis=key.shift() or key.lbutton() pos=0 title=app.name image=\uE249)
{
    item(title="config" image=\uE10A cmd='"@app.cfg"')
    item(title="manager" image=\uE0F3 admin cmd='"@app.exe"')
    item(title="directory" image=\uE0E8 cmd='"@app.dir"')
    item(title="version\t"+@app.ver vis=label col=1)
    item(title="docs" image=\uE1C4 cmd='https://nilesoft.org/docs')
    item(title="donate" image=\uE1A7 cmd='https://nilesoft.org/donate')
}
menu(where=@(this.count == 0) type='taskbar' image=icon.settings expanded=true)
{
    // menu(title="Apps" image=\uE254)
    // {
    // 	item(title='Paint' image=\uE116 cmd='mspaint')
    // 	item(title='Calculator' image=\ue1e7 cmd='calc.exe')
    // 	item(title=str.res('regedit.exe,-16') image cmd='regedit.exe')
    
    // }
    item(title='Task Scheduler' image=\ue126 cmd='taskschd.msc')
    item(title='Group Policy' image=\ue202 cmd='gpedit.msc')
    item(title='MSconfig' image=\ue0be cmd='msconfig.exe')
    item(title='Services' image=\ue069 cmd='services.msc')
    item(title='Disk' image=\ue046 cmd='Diskmgmt.msc')
    item(title='Regedit' image=\ue231 cmd='regedit.exe')
    item(title='Devices' image=\ue260 cmd='devmgmt.msc')
    
    separator
    item(title=title.task_manager sep=both image=icon.task_manager cmd='taskmgr.exe')
    item(title=title.taskbar_Settings sep=both image=inherit cmd='ms-settings:taskbar')
    item(vis=key.shift() title=title.exit_explorer cmd=command.restart_explorer)
}
