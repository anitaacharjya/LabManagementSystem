<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkboxes with Dynamic Submit Buttons</title>
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
        .disabled-checkbox {
            opacity: 0.5;
            pointer-events: none;
        }
    </style>
</head>
<body>

    <!-- Dynamic Row Structure -->
    <div class="row" >
        <h4>Row 1</h4>
        <div class="checkbox-container">
            <label><input type="checkbox" class="sample-checkbox" value="1" onchange="toggleSubmitButton(this)"> Pending 1</label>
            <label><input type="checkbox" class="sample-checkbox" value="2" onchange="toggleSubmitButton(this)"> Pending 2</label>
            <label><input type="checkbox" class="sample-checkbox" value="3" onchange="toggleSubmitButton(this)"> Pending 3</label>
            <label><input type="checkbox" class="sample-checkbox" value="4" onchange="toggleSubmitButton(this)"> Pending 4</label>
            <label><input type="checkbox" class="sample-checkbox" value="5" onchange="toggleSubmitButton(this)"> Pending 5</label>
        </div>
        <div class="submit-container hidden">
            <button class="submit-btn" onclick="submitSamples(this)">Submit</button>
        </div>
    </div>
    
    

    <div class="row" >
        <h4>Row 2</h4>
        <div class="checkbox-container">
            <label><input type="checkbox" class="sample-checkbox" value="6" onchange="toggleSubmitButton(this)"> Pending 6</label>
            <label><input type="checkbox" class="sample-checkbox" value="7" onchange="toggleSubmitButton(this)"> Pending 7</label>
            <label><input type="checkbox" class="sample-checkbox" value="8" onchange="toggleSubmitButton(this)"> Pending 8</label>
            <label><input type="checkbox" class="sample-checkbox" value="9" onchange="toggleSubmitButton(this)"> Pending 9</label>
            <label><input type="checkbox" class="sample-checkbox" value="10" onchange="toggleSubmitButton(this)"> Pending 10</label>
        </div>
        <div class="submit-container hidden">
            <button class="submit-btn" onclick="submitSamples(this)">Submit Row</button>
        </div>
    </div>

    <!-- Additional rows can be added here dynamically -->

    <script>
        // Function to check if any checkbox is selected in the specific row
        function toggleSubmitButton(checkbox) {
        	alert("A");
            const row = checkbox.closest('.row');
            const submitContainer = row.querySelector('.submit-container');
            const checkboxes = row.querySelectorAll('.sample-checkbox');
            
            let isChecked = false;

            // Check if any checkbox is checked
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    isChecked = true;
                }
            });

            // Show or hide the submit button for the row
            if (isChecked) {
                submitContainer.classList.remove('hidden');
                disableOtherRows(row, true);
            } else {
                submitContainer.classList.add('hidden');
                disableOtherRows(row, false);
            }
        }

        // Function to disable checkboxes in other rows
        function disableOtherRows(selectedRow, disable) {
            const allRows = document.querySelectorAll('.row');
            
            allRows.forEach(row => {
                if (row !== selectedRow) {
                    const checkboxes = row.querySelectorAll('.sample-checkbox');
                    checkboxes.forEach(checkbox => {
                        checkbox.disabled = disable;
                        checkbox.classList.toggle('disabled-checkbox', disable);
                    });
                }
            });
        }

        // Function to collect and submit the selected checkbox values for the specific row
        function submitSamples(button) {
            const row = button.closest('.row');
            const selectedSamples = [];
            const checkboxes = row.querySelectorAll('.sample-checkbox');

            // Collect selected checkboxes' values
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    selectedSamples.push(checkbox.value);
                }
            });

            // Display the selected sample values (replace with actual logic)
            alert('Submitting selected samples from this row: ' + selectedSamples.join(', '));

            // Here you can add your actual submission logic (e.g., AJAX call to the server)
        }
    </script>

</body>
</html>
