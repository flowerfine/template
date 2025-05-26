[![Gihub Actions](https://github.com/flowerfine/flinkful/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/flowerfine/flinkful/actions) [![Last commit](https://img.shields.io/github/last-commit/flowerfine/flinkful.svg)](https://github.com/flowerfine/flinkful) [![GitHub Tag](https://img.shields.io/github/v/tag/flowerfine/flinkful)](https://github.com/flowerfine/flinkful/tags) [![Maven Central](https://img.shields.io/maven-central/v/cn.sliew/flinkful)](https://maven-badges.herokuapp.com/maven-central/cn.sliew/flinkful) [![License](https://img.shields.io/github/license/flowerfine/flinkful.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

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

## License

Template is licenced under the Apache License Version 2.0, link is [here](https://www.apache.org/licenses/LICENSE-2.0.txt).