[![Gihub Actions](https://github.com/flowerfine/template/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/flowerfine/template/actions) [![Last commit](https://img.shields.io/github/last-commit/flowerfine/template.svg)](https://github.com/flowerfine/template) [![GitHub Tag](https://img.shields.io/github/v/tag/flowerfine/template)](https://github.com/flowerfine/template/tags) [![Maven Central](https://img.shields.io/maven-central/v/cn.sliew/template)](https://maven-badges.herokuapp.com/maven-central/cn.sliew/template) [![License](https://img.shields.io/github/license/flowerfine/template.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

# Template

Project Template

## Quick Start

If you're using Maven, that looks like this:

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>cn.sliew</groupId>
            <artifactId>template-dependencies</artifactId>
            <version>${latest}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>

<!-- 或者 -->
<parent>
    <groupId>cn.sliew</groupId>
    <artifactId>template-spring-boot-parent</artifactId>
    <version>${latest}</version>
    <relativePath/>
</parent>
```

Template depends on [carp-parent](https://github.com/flowerfine/carp-parent)

## TODO

docs，开发文档，启动文档，部署文档

项目结构说明



## License

Template is licenced under the Apache License Version 2.0, link is [here](https://www.apache.org/licenses/LICENSE-2.0.txt).