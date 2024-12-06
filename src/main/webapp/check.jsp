<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkboxes with One Submit Button</title>
    <style>
        .hidden {
            display: none;
        }
        .row {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
        }
        .checkbox-container {
            display: flex;
            flex-wrap: wrap;
        }
        .checkbox-container label {
            margin-right: 10px;
        }
        .submit-container {
            margin-top: 10px;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <!-- Row 1 -->
    <div class="row" id="row-1">
        <h4>Row 1</h4>
        <div class="checkbox-container">
            <label><input type="checkbox" class="sample-checkbox" value="1" onchange="toggleSubmitButton()"> Pending 1</label>
            <label><input type="checkbox" class="sample-checkbox" value="2" onchange="toggleSubmitButton()"> Pending 2</label>
            <label><input type="checkbox" class="sample-checkbox" value="3" onchange="toggleSubmitButton()"> Pending 3</label>
            <label><input type="checkbox" class="sample-checkbox" value="4" onchange="toggleSubmitButton()"> Pending 4</label>
            <label><input type="checkbox" class="sample-checkbox" value="5" onchange="toggleSubmitButton()"> Pending 5</label>
            <label><input type="checkbox" class="sample-checkbox" value="6" onchange="toggleSubmitButton()"> Pending 6</label>
            <label><input type="checkbox" class="sample-checkbox" value="7" onchange="toggleSubmitButton()"> Pending 7</label>
            <label><input type="checkbox" class="sample-checkbox" value="8" onchange="toggleSubmitButton()"> Pending 8</label>
            <label><input type="checkbox" class="sample-checkbox" value="9" onchange="toggleSubmitButton()"> Pending 9</label>
            <label><input type="checkbox" class="sample-checkbox" value="10" onchange="toggleSubmitButton()"> Pending 10</label>
        </div>
    </div>

    <!-- Row 2 -->
    <div class="row" id="row-2">
        <h4>Row 2</h4>
        <div class="checkbox-container">
            <label><input type="checkbox" class="sample-checkbox" value="11" onchange="toggleSubmitButton()"> Pending 11</label>
            <label><input type="checkbox" class="sample-checkbox" value="12" onchange="toggleSubmitButton()"> Pending 12</label>
            <label><input type="checkbox" class="sample-checkbox" value="13" onchange="toggleSubmitButton()"> Pending 13</label>
            <label><input type="checkbox" class="sample-checkbox" value="14" onchange="toggleSubmitButton()"> Pending 14</label>
            <label><input type="checkbox" class="sample-checkbox" value="15" onchange="toggleSubmitButton()"> Pending 15</label>
            <label><input type="checkbox" class="sample-checkbox" value="16" onchange="toggleSubmitButton()"> Pending 16</label>
            <label><input type="checkbox" class="sample-checkbox" value="17" onchange="toggleSubmitButton()"> Pending 17</label>
            <label><input type="checkbox" class="sample-checkbox" value="18" onchange="toggleSubmitButton()"> Pending 18</label>
            <label><input type="checkbox" class="sample-checkbox" value="19" onchange="toggleSubmitButton()"> Pending 19</label>
            <label><input type="checkbox" class="sample-checkbox" value="20" onchange="toggleSubmitButton()"> Pending 20</label>
        </div>
    </div>

    <!-- Submit Button for All Rows -->
    <div id="submit-container" class="submit-container hidden">
        <button class="submit-btn" onclick="submitSamples()">Submit</button>
    </div>

    <script>
        // Function to check if any checkbox is selected
        function toggleSubmitButton() {
            const checkboxes = document.querySelectorAll('.sample-checkbox');
            const submitContainer = document.getElementById('submit-container');
            let isChecked = false;

            // Check if any checkbox is checked
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    isChecked = true;
                }
            });

            // Show or hide the submit button
            if (isChecked) {
                submitContainer.classList.remove('hidden');
            } else {
                submitContainer.classList.add('hidden');
            }
        }

        // Function to collect and submit the selected checkbox values
        function submitSamples() {
            const selectedSamples = [];
            const checkboxes = document.querySelectorAll('.sample-checkbox');

            // Collect selected checkboxes' values
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    selectedSamples.push(checkbox.value);
                }
            });

            // Display the selected sample values (replace with actual logic)
            alert('Submitting selected samples: ' + selectedSamples.join(', '));

            // Here you can add your actual submission logic (e.g., AJAX call to the server)
        }
    </script>

</body>
</html>

    