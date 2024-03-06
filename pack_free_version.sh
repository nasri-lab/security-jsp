plugins_location="/home/nasri/www"

plugin_location="$plugins_location/security-jsp"

if [ -d "$plugin_location" ]; then
    rm -r "$plugin_location"
    echo "$plugin_location Folder removed."
fi

# Create directories
mkdir -p "$plugin_location"

# Copy files for the free plugin
cp -r ./project-code/* "$plugin_location"

chown -R www-data.www-data $plugin_location
chmod -R 755 $plugin_location

# Run docker compose
docker-compose up