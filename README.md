# spring-jte-demo

A small blog app built with Spring Boot, [JTE](https://jte.gg/) and TailwindCSS.
Everything is rendered on the server — no JavaScript framework, no bundler.

Companion project for
[this post](https://ilkinmhd.com/posts/spring-boot-jte-tailwindcss-fullstack-mvc/).

## Stack

- Spring Boot 4.1.1 on Java 25
- JTE 3.2.4 (`jte-spring-boot-starter-4`)
- TailwindCSS 4
- H2 in-memory database, Spring Data JPA
- Gradle 9.7.1

## Running it

Build the stylesheet, then start the app with the `dev` profile for template
hot reload:

```bash
cd src/main/frontend && npm install && npm run watch
```

```bash
./gradlew bootRun --args='--spring.profiles.active=dev'
```

Then open http://localhost:8080.

For a packaged run:

```bash
cd src/main/frontend && npm run build && cd -
./gradlew build
java -jar build/libs/spring-jte-blogapp-0.0.1-SNAPSHOT.jar
```

## Layout

```
src/main/jte/          templates (.jteroot marks the root)
  layout/main.jte      page shell, takes a title and a content block
  pages/               home, index, post, postNew
src/main/frontend/     Tailwind input; builds to resources/static/css/main.css
```

## Two things worth knowing

**JTE has two settings that must agree.** For a packaged jar you need both
`gg.jte.use-precompiled-templates=true` and `gg.jte.development-mode=false`.
Set only the first and the context fails to start; set only development mode
and the jar starts fine, then returns 500 on every request because it tries to
compile templates from source that a jar does not contain.

**Tailwind v4 has no config file.** The theme lives in `styles.css` under
`@theme`, and `@source "../jte"` is what points it at the templates — without
that line you get a stylesheet with none of the classes the templates use.
