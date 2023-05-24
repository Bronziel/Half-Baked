const admin = require('firebase-admin');
const fs = require('fs');
const path = require('path');

// Path to the service account key JSON file
const serviceAccountPath = path.resolve(__dirname, 'serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccountPath),
  // The following line is not necessary if your Firestore database is in the
  // default (us-central1) location.
  //databaseURL: 'https://your-project-id.firebaseio.com',
});

const db = admin.firestore();

const importRecipes = async () => {
  const filePath = path.join(__dirname, '..', 'lib', 'initial_recipes.json');
  const jsonData = fs.readFileSync(filePath, 'utf-8');
  const recipes = JSON.parse(jsonData);

  for (const recipe of recipes) {
    const recipeRef = db.collection('recipes').doc();
    await recipeRef.set(recipe);
  }

  console.log('Recipes imported successfully');
};

importRecipes()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Error importing recipes:', error);
    process.exit(1);
  });
