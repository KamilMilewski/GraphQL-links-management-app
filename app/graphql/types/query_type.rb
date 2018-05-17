Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # field :allLinks, !types[Types::LinkType] do
  #   resolve -> (obj, args, ctx) { Link.all }
  # end
  field :allLinks, function: Resolvers::LinksSearch

  field :link, Types::LinkType do
    argument :id, types.Int
    resolve -> (obj, args, ctx) do
       Link.find(args[:id])
     end
  end

  field :allUsers, !types[Types::UserType] do
    resolve -> (obj, args, ctx) { User.all }
  end
end
