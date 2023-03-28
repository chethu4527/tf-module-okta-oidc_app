# cah-tf-module-your-module-name

This is the template repository to use to start a terraform module. It contains the initial files and folder structure to use. Update this area to include a description of what your module does.

## Providers

A list of the providers you are expecting to be available in the enclosing main.tf file

## Inputs/Variables (see variables.tf)

Defined inputs to your modlue with descriptions
|Name |Description |Type | Default | Required
|----------------|-------------------------------|-----------------------------|-------| -------|
|var_name |var description | string, number, list, etc.. | t/f | t/f |

## Outputs (see outputs.tf)

Defined outputs you will provide to the callers of this module
|Name |Description |
|----------------|-------------------------------|
| var_name | description |

## Troubleshooting

### Determining values in the module

In terraform it can difficult to figure out what a variable's name and value is when you're troubleshooting. An easy way to figure that out is to create an output variable that exposes the variable and then run `terraform refresh`. That will show you the name and
value of the variable you configure.

Give some other tips or scenarios here where things might appear to fail and some resolutions if there are any

# Module Metadata

This section is related to this module template and how to use it. None of what follows should be in the final module
you release.

## Creating a repository from this template

From the Github UI you can select the button at the top that reads "Use this template". That will begin the proces of creating a new repo with this as the base. For more info see the official [github docs](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)

## Module Organization

- main.tf - the majority of your module specific code goes here.
- variables.tf - parameters sent to your module from the calling stanza
- outputs.tf - values you will supply to the caller based on resources, data and variables in this module

## Submodules

Feel free to create subfolders with submodules where you reuse code to perform internal functions. These
submodules will never be accessible outside of this module except in cases where you pipe in functionality via
variables.

## Tag the module repo for search

Initially add the topic `cah-terraform-module` to the module repository so searching and identifying Cardinal Terraform moudles
is easier. In addition, add a topic that identifies the category of the Terraform module by choosing one of the categories below (w.i.p):

- `network`
- `cloud infrastrucure`
- `on-prem infrastrucure`
- `application`
- `database`

## Releasing

Want to make a new version?  
Just check out the latest tag and run

```
git tag vx.x.x
git push --tags
```

## Calling This Module

To call this module, a caller would need to declare their own module stanza then provide a path to a specific
version of this module. Example:

```
module "my_module" {
    source               = "git@github.com:CardinalHealth/terraform-cah-module-your-module-name?ref=v0.0.1"
    the_rest_of_the_vars = "value"
}
```
# Maintainers
List the individual or team that own this module (accountable for it)  and the email where to send request for contribution such as <GMBTeam@cardinalhealth.com>

