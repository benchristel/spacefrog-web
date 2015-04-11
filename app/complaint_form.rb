class ComplaintForm
  def initialize(layout)
    @layout = layout
  end

  def html
    @layout.wrap %^
    <div id="preview"><p class="close-button close-x"><span data-close="preview"></span></p>
      <p class="center">This email will be sent to sfo.noise@flysfo.com:</p>
      <div id="preview-content"></div>
      <div class="center"><button id="submit">Submit</button></div>
    </div>
    <div id="success">
      You have successfully complained!
    </div>

    <div id="form-wrapper">
      <label>I would like to register a complaint!</label>

      <div>
        <p><span class="label-column">on </span><input id="time" type="datetime-local" data-formatter="time"></p>
        <p><span class="label-column">a </span><select id="aircraft-type">
          <option value="" selected="selected">Aircraft Type</option>
          <option value="General Aviation">Light Aircraft</option>
          <option value="Helicopter">Helicopter</option>
          <option value="Jet">Jet</option>
          <option value="Military">Military Doodad</option>
          <option value="Propeller">Propeller Thing</option>
          <option value="Turboprop">Turboprop Plane</option>
          <option value="Zeppelin/Airship/Blimp">Zeppelin</option>
        </select></p>
        <p><span class="label-column">did a </span><select id="disturbance-type">
          <option value="" selected="selected">Disturbance Type</option>
          <option value="Low">Low Flyover</option>
          <option value="Loud disturbance">Loud Disturbance</option>
          <option value="Low and loud">Low and Loud Disturbance</option>
          <option value="Frequent">Frequent Disturbance</option>
          <option value="Vibration">Vibration</option>
          <option value="Pollution">Pollution</option>
          <option value="Off course">Off-Course Flight</option>
          <option value="Run-up">Run-Up</option>
          <option value="Unusual behavior">Weird Thing</option>
          <option value="Auxiliary Power Unit (APU)">Auxiliary Power Unit (APU)</option>
          <option value="Taxiing aircraft">Taxi</option>
          <option value="Other">Other</option>
        </select></p>
        <p><span class="label-column">affecting my </span><select id="activity-disturbed">
          <option value="" selected="selected">Activity Disturbed</option>
          <option value="Conversation">Conversation</option>
          <option value="Hearing">Hearing</option>
          <option value="Meal time">Meal Time</option>
          <option value="Quality of life">Quality Of Life</option>
          <option value="Outdoors">Outdoors</option>
          <option value="Reading">Reading</option>
          <option value="Radio">Radio</option>
          <option value="Telephone">Telephone</option>
          <option value="Television">Television</option>
          <option value="Sleep">Sleep</option>
          <option value="Study">Study</option>
          <option value="Work at home">Work At Home</option>
          <option value="Other">Other</option>
        </select></p>
        <p><span class="label-column">comments </span><textarea id="comments" rows="3" cols="20"></textarea></p>
        <p><span class="label-column">respond?</span><select id="response-method">
          <option value="No Response Needed" selected="selected">No Response Needed</option>
          <option value="Yes - via Email">Respond Via Email</option>
          <option value="Yes - call my home phone">Call My Home Phone</option>
          <option value="Yes - call my cell phone">Call My Cell Phone</option>
          <option value="Yes - call my work phone">Call My Work Phone</option>
        </select></p>
      </div>

      <div>
        <label>Your name:</label>
        <select id="name-prefix">
          <option value="" selected="selected">Prefix</option>
          <option value="Mr.">Mr.</option>
          <option value="Mrs.">Mrs.</option>
          <option value="Ms.">Ms.</option>
          <option value="Hon.">Hon.</option>
          <option value="Rev.">Rev.</option>
          <option value="Dr.">Dr.</option>
        </select>
        <input id="first-name" type="text" placeholder="First Name" size="10">
        <input id="last-name" type="text" placeholder="Last Name" size="16">
      </div>

      <div>
        <label>Your address:</label>

        <p><input id="address-1" type="text" placeholder="Address Line 1" size="30"></p>
        <p><input id="address-2" type="text" placeholder="Address Line 2" size="30"></p>
        <p>
          <input id="city" type="text" placeholder="City" size="18">
          <input id="zip-code" type="text" placeholder="Zip Code" size="9">
        </p>
      </div>

      <div>
        <label>Your contact info:</label>

        <p><input id="email" type="email" placeholder="Email"></p>
        <p><input id="home-phone" type="text" placeholder="Home Phone" data-formatter="phone"></p>
        <p><input id="work-phone" type="text" placeholder="Work Phone" data-formatter="phone"></p>
        <p><input id="cell-phone" type="text" placeholder="Cell Phone" data-formatter="phone" ></p>
      </div>

      <div>
        <label>If you've submitted a complaint before and gotten a caller code, enter it here:</label>
        <p><input id="caller-code" type="text" placeholder="Caller Code"></p>
      </div>

      <div><button id="preview-button">Preview Submission</button></div>
    </div>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="form.js"></script>
    ^
  end
end
