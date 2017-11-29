* 解决maven pom.xml的execution标签的一个错误：
  在Window->Perferences->Maven->Lifecycle Mapping
  插入内容```
  <?xml version="1.0" encoding="UTF-8"?>
<lifecycleMappingMetadata>
	<pluginExecutions>   
 		<pluginExecution>
			<pluginExecutionFilter>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-dependency-plugin</artifactId>
                <goals>
                    <goal>unpack</goal>
                </goals>
                <versionRange>[1.3,)</versionRange>
            </pluginExecutionFilter>
            <action>
                <ignore />
            </action>
		</pluginExecution>        
	</pluginExecutions>
</lifecycleMappingMetadata>
```
点击 ”Reload workspace lifecycle mappings metadata“按钮，然后Maven -> update


* Eclipse Maven pom报错:org.apache.maven.archiver.MavenArchiver.getManifest(org.apache.maven.project.MavenProject, org.apache.maven.archiver.MavenArchiveConfiguration)
 pom.xml / line 1 Maven Configuration Problem
> A:1、Help——>Install New SoftWare
https://otto.takari.io/content/sites/m2e.extras/m2eclipse-mavenarchiver/0.17.2/N/LATEST/
3.按照安装提示，一直next，重启eclipse之后，执行maven-update project

* 找不到本地cloud-commons*.jar包:Failed to execute goal on project cloud-demo: Could not resolve dependencies for project com.ppx.cloud:cloud-demo:jar:0.0.1-RELEASE:
> A:把cloud-parent和cloud-commons进行mvn install



* spring boot加了devtools后启动报错
项目启动结束时停到了如下位置：
```
public static void exitCurrentThread() {
throw new SilentExitException();
}
```
不过倒不影响项目运行，在stackoverflow上找到的解决方案是：
Eclipse -> Preferences ->Java ->Debug->去掉"Suspend execution on uncaught exceptions"前面的勾







