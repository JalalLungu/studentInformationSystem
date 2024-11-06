<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi-step Form</title>
    <link rel="stylesheet" href="styles-su.css">
</head>

<body>
    <div class="container" id="container">
        <form>
            <!-- Radio buttons to control the step view -->
            <input type="radio" id="step1" name="steps" checked />
            <input type="radio" id="step2" name="steps" />
            <input type="radio" id="step3" name="steps" />

            <!-- Step 1 -->
            <div class="form-step step1">
                <h1>Part 1: Personal Details</h1>

                <label for="surname">Surname:</label>
                <input type="text" id="surname" name="surname" required />

                <label for="otherNames">Other Names:</label>
                <input type="text" id="otherNames" name="otherNames" required />

                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required />

                <label for="pob">Place of Birth:</label>
                <input type="text" id="pob" name="pob" required />

                <label for="sex">Sex:</label><br>
                <input type="radio" id="male" name="sex" value="Male" required /> Male
                <input type="radio" id="female" name="sex" value="Female" required /> Female<br>

                <label for="nationality">Nationality:</label>
                <input type="text" id="nationality" name="nationality" required />

                <label for="nrc_passport">NRC/Passport No:</label>
                <input type="text" id="nrc_passport" name="nrc_passport" required />

                <label for="postal_address">Postal Address:</label>
                <textarea id="postal_address" name="postal_address" rows="2" required></textarea>

                <label for="residential_address">Residential Address:</label>
                <textarea id="residential_address" name="residential_address" rows="2" required></textarea>

                <label for="tel_cell">Tel/Cell:</label>
                <input type="tel" id="tel_cell" name="tel_cell" required />

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required />

                <label for="disability">Do you have any physical or communication disabilities?</label><br>
                <input type="checkbox" id="visibility" name="disability" value="Visibility" /> Visibility<br>
                <input type="checkbox" id="mobility" name="disability" value="Mobility" /> Mobility<br>
                <input type="checkbox" id="speech" name="disability" value="Speech" /> Speech<br>
                <input type="checkbox" id="hearing" name="disability" value="Hearing" /> Hearing<br>
                <input type="checkbox" id="others" name="disability" value="Others" /> Others<br>

                <label for="disability_details">If any, provide details:</label>
                <textarea id="disability_details" name="disability_details" rows="3"></textarea>

                <!-- Navigation buttons -->
                <button type="button" class="next-button" onclick="document.getElementById('step2').checked = true">Next</button>
            </div>

            <!-- Step 2 -->
            <div class="form-step step2">
                <h1>Part 2: Education</h1>

                <label for="schools">Schools attended (Years and level of attainment):</label>
                <textarea id="schools" name="schools" rows="3" required></textarea>

                <label for="exam_number">Grade 12/Form 5 Examination Number:</label>
                <input type="text" id="exam_number" name="exam_number" required />

                <label for="exam_body">Examination Body:</label>
                <input type="text" id="exam_body" name="exam_body" required />

                <label for="exam_year">Year:</label>
                <input type="text" id="exam_year" name="exam_year" required />

                <label for="subjects">O Level subjects or equivalents passed and grades:</label>
                <textarea id="subjects" name="subjects" rows="4" required></textarea>

                <!-- Navigation buttons -->
                <button type="button" class="prev-button" onclick="document.getElementById('step1').checked = true">Previous</button>
                <button type="button" class="next-button" onclick="document.getElementById('step3').checked = true">Next</button>
            </div>

            <!-- Step 3 -->
            <div class="form-step step3">
                <h1>Part 3: Professional Qualifications</h1>

                <label for="institution">Institution:</label>
                <input type="text" id="institution" name="institution" required />

                <label for="qualification">Qualification:</label>
                <input type="text" id="qualification" name="qualification" required />

                <label for="date_obtained">Date Obtained:</label>
                <input type="date" id="date_obtained" name="date_obtained" required />

                <h1>Part 5: Sponsor Details</h1>

                <label for="sponsor_name">Sponsor Name (Prof/Dr/Mr/Mrs/Ms or Company):</label>
                <input type="text" id="sponsor_name" name="sponsor_name" required />

                <label for="sponsor_address">Address:</label>
                <textarea id="sponsor_address" name="sponsor_address" rows="2" required></textarea>

                <label for="sponsor_relationship">Relationship to Applicant:</label>
                <input type="text" id="sponsor_relationship" name="sponsor_relationship" required />

                <label for="sponsor_signature">Sponsor Signature:</label>
                <input type="text" id="sponsor_signature" name="sponsor_signature" required />

                <label for="sponsor_date">Date:</label>
                <input type="date" id="sponsor_date" name="sponsor_date" required />

                <!-- Navigation buttons -->
                <button type="button" class="prev-button" onclick="document.getElementById('step2').checked = true">Previous</button>

                <!-- Submit button -->
                <button type="submit" class="submit-button">Submit</button>
            </div>
        </form>
    </div>

</body>

</html>