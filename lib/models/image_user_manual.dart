class ImageManual {
  String image;
  String textContent;

  ImageManual({required this.image, required this.textContent});
}

List<ImageManual> imageManual = [
  // 0 = assessment page tutor confirm button
  ImageManual(
      image:
          "https://cdn.discordapp.com/attachments/901148263502196816/1046509248961581137/image.png",
      textContent:
          "Description : Nutritional status screening page\n1. progress tube is a tube that indicates the status of the nutritional status screening. \n2. Calculate BMI, enter weight and height, then enter confirmation to calculate BMI.\n3. There are four screening topics, each with a yes and no answer."),
  // 1 = assessment page tutor yes or no button
  ImageManual(
      image:
          'https://cdn.discordapp.com/attachments/901148263502196816/1046512019156766810/image.png',
      textContent:
          'Description : The screening can be viewed in sequence of numbers as follows.\n1. Choose an answer : In this screening, there are two possible answers: yes and no.\n2. Once the answer has been selected, press the next button to do so. next screening'),
  // 2 = perioperative calculator page step 1
  ImageManual(
      image:
          "https://cdn.discordapp.com/attachments/901148263502196816/1046508866332004432/image.png",
      textContent:
          "Description : Case Information\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic."),
  // 3 = perioperative calculator page step 2
  ImageManual(
      image:
          'https://cdn.discordapp.com/attachments/901148263502196816/1046509794061713528/image.png',
      textContent:
          'Description : Daily Requirement\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic.'),
  // 4 = dialysis calculator page step 1
  ImageManual(
      image:
          "https://cdn.discordapp.com/attachments/901148263502196816/1046520691559780413/image.png",
      textContent:
          "Description : Case Information\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic."),
  // 5 = dialysis calculator page step 2
  ImageManual(
      image:
          'https://cdn.discordapp.com/attachments/901148263502196816/1046520826226299030/image.png',
      textContent:
          'Description : Case Information\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic.'),
  // 6 = dialysis calculator page step 3
  ImageManual(
      image:
          "https://cdn.discordapp.com/attachments/901148263502196816/1046520916093456434/image.png",
      textContent:
          "Description : Case Information\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic."),
  // 7 = dialysis calculator page step 4
  ImageManual(
      image:
          'https://cdn.discordapp.com/attachments/901148263502196816/1046521046372716594/image.png',
      textContent:
          'Description : Case Information\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic.'),
  // 8 = result page
  ImageManual(
      image:
          "https://cdn.discordapp.com/attachments/901148263502196816/1046509594832281792/image.png",
      textContent:
          "Description :\n1. The result button is a button to display the graph results for calculating the selection of nutrients.\n2. Show transaction results can go back to edit by pressing the edit button\n3. This is a button for adding a product selection item."),
  // 9 = add result page
  ImageManual(
      image:
          'https://cdn.discordapp.com/attachments/901148263502196816/1046509947959128215/image.png',
      textContent:
          'Description :\n1. This is a page for selecting a product list and entering numeric values as required by the user.\n2. There are 3 buttons for data management to choose from: Continue Cancel Delete.'),
  // 10 = graph page
  ImageManual(
      image:
          "https://cdn.discordapp.com/attachments/901148263502196816/1046510016619872376/image.png",
      textContent:
          "Description :\n1. Here is a graph showing the selection results calculated from the product list selection.\n2. You can download this result or you can print it."),
];
