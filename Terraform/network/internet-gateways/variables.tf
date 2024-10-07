variable "nodejs_starter_ig" {
    description = "Internet Gateway for the NodeJS Starter application"
    type = object({
        vpc_id = string
        tags = map(string) 
    })
}