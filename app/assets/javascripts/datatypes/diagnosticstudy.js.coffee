###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
by a clinician or appropriately licensed care provider to an appropriate
provider or organization to perform the diagnostic study indicated by the QDM
category and its corresponding value set. The request may be in the form of a
consultation or a direct order to the organization that performs the diagnostic
study. Diagnostic studies are those that are not performed in the clinical
laboratory. Such studies include but are not limited to imaging studies,
cardiology studies (electrocardiogram, treadmill stress testing), pulmonary
function testing, vascular laboratory testing, and others.
###
class CQL_QDM.DiagnosticStudyOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason?.code_system)


###
Data elements that meet criteria using this datatype should document the
completion of the diagnostic study indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DiagnosticStudyPerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_facilityLocation = @entry.facility_location
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    @_result = @entry.result
    @_resultDatetime = CQL_QDM.Helpers.convertDateTime(@entry.result_date_time)
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_status = @entry.status

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation?.code, @_facilityLocation?.code_system)

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason?.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow.toDate())
    high = cql.DateTime.fromDate(@_relevantPeriodHigh.toDate())
    new cql.Interval(low, high)

  ###
  @returns {Code}
  ###
  result: ->
    cql.Code(@_result?.code, @_result?.code_system)

  ###
  @returns {Date}
  ###
  resultDatetime: ->
    cql.DateTime.fromDate(@_resultDatetime.toDate())

  ###
  @returns {Code}
  ###
  status: ->
    cql.Code(@_status?.code, @_status?.code_system)


###
Data elements that meet criteria using this datatype should document a
recommendation for a request by a clinician or appropriately licensed care
provider to an appropriate provider or organization to perform the diagnostic
study indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.DiagnosticStudyRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})
