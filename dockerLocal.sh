
#setup docker version of postgres locally
docker-compose up --build

#load northwind
psql -U postgres -d postgres -h localhost -p 5433 -a -f resources/northwind.sql
