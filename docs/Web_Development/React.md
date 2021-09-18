# React Overview

[React](https://reactjs.org/) is a javascript library that renders application state as HTML.

## Differences from Other Frameworks

React is very different than other web development frameworks such as Angular.
React is a view engine to render information into the HTML DOM.
Whereas other frameworks such as Angular deal with all aspects of web application development such as routing, making HTTP requests, etc.

React suffers from a lack of cohesive development tooling particularly around build tooling.
It often requires piecing together many independent javascript libraries to get a simple application working.
Whereas frameworks like Angular include build tooling out of the box.

However, this leads to React being more lightweight.
Depending on how many external dependencies are needed, it can be built into pages with a much smaller footprint than an Angular application.

The simple solution to this is using the [Create React App](https://create-react-app.dev/) tooling to provide a simple build environment.
However, that set of tooling is not very flexible.
Deviation from the default configuration often can mean "ejecting" from the create react app tooling.
This just copies and pastes all the build tooling code and configuration within the application itself that can then be modified.

There are several web bundlers that can be used to build and bundle React applications.
However, each one has a varying degree of difficulty to configure.

[Webpack](https://webpack.js.org/) is most full featured, but requires a good amount of configuration to get working.
[Parcel](https://parceljs.org/) is easier to configure.

## Syntax

React also differs in that it's primary way to build views as a superset of Javascript and even has support in Typescript.
In short it is like mixing HTML with javascript in the same file.
Although the code doesn't actually produce the raw HTML used for the application.

This is different than something like Angular that can use an HTML template per component with some added special syntax for different types of bindings.

This new syntax is handled through transpilation.
A tool such as [Babel](https://babeljs.io/) will be used to convert the syntax to a Javascript friendly library that can be run directly in the browser.

For example, here is an extremely simple example of a functional component that renders a div tag.

```jsx
export function FunctionalComponent() {
    return <div>Hello, world!</div>
}
```

## Helpful NPM Packages

### General Packages

There are a number of common libraries that can help get a React application running.

* [react-router](https://reactrouter.com/) - This package deals with routing in applications, typically for single page applications.
* [redux](https://redux.js.org/) - The package manages application state for javascript applications.
* [react-redux](https://react-redux.js.org/) - This package manages state for an application through a single store that connects in with React.  This is a good library to use for larger applications with more and complex state.
* [redux-toolkit](https://redux-toolkit.js.org/) - This package simplifies development with React by combining actions, reducers, and action creators into a 'Slice'.  It also includes functions to set up common sense defaults and immutable state via immer.

### UI Based Packages

* [react-simple-maps](https://www.react-simple-maps.io/) - For building simple SVG based maps.
