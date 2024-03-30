/* eslint-disable max-len */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
require("firebase-functions");
require("firebase-functions/v2/https");
require("firebase-functions/v2/firestore");

const axios = require("axios");
// The Firebase Admin SDK to access Firestore.
require("firebase-admin/app");
require("firebase-admin/firestore");

admin.initializeApp();

exports.addDiscordDataToFirestore = functions.https.onCall(async (data, context) => {
  const discordToken = "MjI4ODY3ODkwNjA5MjU4NTA2.GIJbRz.dHb1rb9UYU22Ez97flpw99ue1kI3Sp7h-ppjYM";
  try {
    // Discord API'den kullanıcı bilgilerini al
    const discordResponse = await axios.get("https://discord.com/api/v9/channels/1191785265228939344/messages", {
      headers: {
        Authorization: `${discordToken}`,
      },
    });

    const userData = {
      id: discordResponse.data.id,
      username: discordResponse.data.username,
      avatar: discordResponse.data.avatar,
      discriminator: discordResponse.data.discriminator,
    };
    await admin.firestore().collection("discordUsers").doc(userData.id).set(userData);
    return {result: `Kullanıcı ${userData.username} başarıyla kaydedildi.`};
  } catch (error) {
    console.error("Discord API hatası:", error);
    // eslint-disable-next-line max-len
    throw new functions.https.HttpsError("unknown", "Discord API hatası oluştu", error);
  }
});
